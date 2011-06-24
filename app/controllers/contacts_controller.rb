class ContactsController < ApplicationController
  before_filter :find_contact, :only => [:show]
  def index
    @contacts = Tag.pfcs_staff.contacts
  end
  
  def show
    
  end
  
  private
  
  def find_contact
    @contact = Contact.find(params[:id])
  end
end
