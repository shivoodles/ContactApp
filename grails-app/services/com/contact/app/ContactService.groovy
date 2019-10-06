package com.contact.app

import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import groovy.util.slurpersupport.GPathResult;
import javax.mail.SendFailedException

import org.codehaus.groovy.grails.commons.GrailsApplication;
import org.springframework.util.*;

import com.google.javascript.jscomp.fuzzing.TryFuzzer.CatchFuzzer;

class ContactService {

	def grailsApplication
	
	def mailService
	
    def getContactList(String code) {
		def contactData= [:]
		try{
		RestBuilder rest = new RestBuilder()
		rest.restTemplate.messageConverters.removeAll {
			it.class.name == 'org.springframework.http.converter.json.GsonHttpMessageConverter'
		}
		
		System.out.print("grailsApplication=="+grailsApplication)
		MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>()
		form.add("code",code)
		form.add("client_id",grailsApplication.config.gmail.client.id)
		form.add("client_secret",grailsApplication.config.gmail.client.secret)
		form.add("redirect_uri",grailsApplication.config.gmail.redirection.url)
		form.add("grant_type", grailsApplication.config.gmail.grant.type)
		def resp = rest.post(grailsApplication.config.gmail.oauth.url) {
			header("Host", grailsApplication.config.gmail.host.name)
			contentType(grailsApplication.config.gmail.oauth.content.type)
			body(form)
		}
		def json = resp.json
		def feedUrl = grailsApplication.config.gmail.feed.url+json.access_token
		def feedData = rest.get(feedUrl);
		
		if(feedData.xml instanceof GPathResult){
			def feeds = new XmlParser().parseText(feedData.text)
			feeds.'entry'.each{ message ->
				contactData[message.'title'.text()] = message.'gd:email'.@'address'[0]
			}
		}
		}catch(Exception ex){
		println "Exception during processing =="+ex.getMessage();
		}
		return contactData;
    }
	
	
	def sendInvitationMail(def userList){
		def message = grailsApplication.config.gmail.success.message
		try{
		userList.each { user -> 
			System.out.println("Sending mail to ::"+user)
			mailService.sendMail {
				//async true
				to user
				subject grailsApplication.config.gmail.email.subject
				body grailsApplication.config.gmail.email.body
			}
		}
		}catch(SendFailedException sfe){
		System.out.println("Exception while sending mail =="+sfe.getMessage())
		message=grailsApplication.config.gmail.error.message
		}catch(Exception ex){
		System.out.println("Exception while processing mail =="+ex.getMessage())
		message=grailsApplication.config.gmail.error.message
		}
		return message
	}
}
