# frozen_string_literal: true

class Sellers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def new
    @seller = Seller.new
    @store = @seller.build_store
  end

  def edit
    @seller = Seller.find(current_seller.id)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end



  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:store_id, :store_name, store_attributes: [:shopcategory_id, :image, :zip_code, :address, :phone_number, :url, :information, :responsible, :responsible_kana, :responsible_phone ] ])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :store_name, store_attributes: [ :shopcategory_id, :image, :zip_code, :address, :phone_number, :url, :information, :responsible, :responsible_kana, :responsible_phone ] ])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    top_managements_path
  end

  def after_update_path_for(_resource)
    top_managements_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
