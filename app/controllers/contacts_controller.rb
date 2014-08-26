class ContactsController < ApplicationController
  
  def index
    @contact = Contact.all
    render json: @contact
  end
  
  def new
    @contact = Contact.new
    render json: "New Contact"
  end
  
  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages
    end
  end
  
  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    
    render json: "contact destroyed"
  end
  
  protected
  def contact_params
    params[:contacts].permit(:name, :email, :user_id)
  end
end
