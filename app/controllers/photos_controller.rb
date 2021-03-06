class PhotosController < ApplicationController

  def homepage
    @list_of_all_my_photos = Photo.all
    render("photos/index.html.erb")
  end

  def create_row
    url = params[:the_source]
    cap = params[:the_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save
    redirect_to("/photos")
  end

  def new_form
    render("photos/new_form.html.erb")
  end

  def index
    @list_of_all_my_photos = Photo.all
    render("photos/index.html.erb")
  end

  def show
    the_id = params[:da_id]
    @my_photo = Photo.find(the_id)
    render("photos/show.html.erb")
  end

  def edit_form
    @my_photo = Photo.find(params[:la_id])
    render("photos/edit_form.html.erb")
  end

  def update_row
    my_photo = Photo.find(params[:le_id])
    my_photo.source = params[:user_url]
    my_photo.caption = params[:user_caption]
    my_photo.save
    redirect_to("/photos/#{my_photo.id}")
  end

  def destroy_row
    @my_photo = Photo.find(params[:da_id])
    @my_photo.destroy
    redirect_to("/photos")
  end



end
