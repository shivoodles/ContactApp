package com.contact.app
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse

import java.lang.annotation.Annotation;

import org.springframework.util.*;

import com.google.gson.InstanceCreator;
class GoogleController {
	
	def contactService
	def grailsApplication
	static allowedMethods = [getAuthention:'GET']
	
	def index() {}
	
    def inviteUsers() {
		List users = []
		if(params.inviteUserList instanceof String){
			users.add(params.inviteUserList)
		}else{
		users = params.inviteUserList
		}
		def message = contactService.sendInvitationMail(users)
		render(view: "/success", model: [result : message])
    }
	
	def getAuthention(){
		def code  =  params.code
		def userData = contactService.getContactList(code);
		render(view: "/contacts", model: [contactList : userData])
		
	}

}


