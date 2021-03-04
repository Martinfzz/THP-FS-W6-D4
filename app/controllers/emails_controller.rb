class EmailsController < ApplicationController
  def index
    @emails = Email.all
    @emails = @emails.sort_by {|obj| obj.created_at }
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true) if !@email.read
    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  def new
    create
  end  

  def create
    @email = Email.new(body: Faker::Lorem.paragraph, object: Faker::Book.title)
    if @email.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js { }
      end
      
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def update
    @email = Email.find(params[:id])
    if @email.read == true
      @email.update(read: false)
      respond_to do |format|
        format.html { }
        format.js { }
      end
    else
      @email.update(read: true)
      respond_to do |format|
      format.html { }
      format.js { }
      end
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
    end
  end
end
