class ContactsController < ApplicationController

  def index
    render json: Contact.all
  end
  def show
    contact = Contact.find(params[:id])
    if contact
      render json: contact
    else
      render text: "could not find contact"
    end
  end
  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end
  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end
  def destroy
    contact = Contact.find(params[:id])
    if contact.destroy
      render json: contact
    else
      render text: "could not destroy contact"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
