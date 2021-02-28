class ChargesController < ApplicationController

  def new
    @charge = Charge.new
  end
  
  def create
    if charge_params[:pay].to_i != 0
      @charge = Charge.new(charge_params)
      if @charge.valid?
        pay_new_charege
        @charge.save
        redirect_to items_path
      else
        render action: :new
      end
    else
      @charge = Charge.new
      render :new
    end
  end

  def edit
    @charge = Charge.find(current_user.charge.id)
  end

  def update
    @charge = Charge.find(params[:id])
    now_charge = @charge.pay
    new_charge = params[:charge][:pay].to_i
    if new_charge != 0 
      params[:charge][:pay] = now_charge + new_charge
      if @charge.update(charge_params) &&  pay_edit_charge(new_charge)
        redirect_to items_path
      else
        render :edit
      end
    else
      @errors = "１以上の半角数字で入力してください"
      render :edit
    end
  end

  private

  def charge_params
    params.require(:charge).permit(:pay).merge(user_id: current_user.id, token: params[:token]) 
  end

  def pay_new_charege
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: charge_params[:pay],
        card: charge_params[:token],
        currency: 'jpy'
      )
  end

  def pay_edit_charge(new_charge)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: new_charge,
        card: charge_params[:token],
        currency: 'jpy'
      )
  end
  
end
