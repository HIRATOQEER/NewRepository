class ContactsController< ApplicationController
 
  before_action :authenticate_user2!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index

     @contacts = Contact.all
  end

  def show
     if current_user2.present?
    @contact = Contact.find(params[:id])
  end
  end
  def edit
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
    


  def update
      if @contact.user2 == current_user2
    @contacts= Contact.find params[:id]
       else
      redirect_to root_path, alert: "You are not authorized to update this contact."
    end
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
    def destroy
    @status_update = Contact.find(params[:id])
    if @status_update.present?
      @status_update.destroy
    end
    redirect_to root_url

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

