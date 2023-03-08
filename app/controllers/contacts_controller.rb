class ContactsController< ApplicationController
  
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index

     @contacts = Contact.all
  end

  def show
     if current_user2.present?
    @contact = Contact.find(params[:id])
  end
  end
 def new
    @contact = Contact.new
  end

   def create
    @contact = current_user2.contacts.build(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

   private
    def set_contact
      @contact = current_user2.contacts.find(params[:id])
    end
    private
    def contact_params
      params.require(:contact).permit(:phone, :name, :email)
    end

end

