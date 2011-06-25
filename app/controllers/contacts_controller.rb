class ContactsController < ApplicationController
  before_filter :find_contact, :only => [:show]
  def index
    @contacts = Tag.pfcs_staff.contacts
  end
  
  def show
    @actionitems = @contact.actionitems.order("item_date desc, id desc")
  end
  
  def search
    @contacts = Contact.where("display_as ilike ?", "%#{params[:search]}%")
    logger.info "COUNT: #{@contacts.count}"
    render "index"
  end
  
  private
  
  def find_contact
    @contact = Contact.find(params[:id])
  end
end
