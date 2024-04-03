class AddressesController < ApplicationController
  # def new
  #   seeker = current_user if current_user.seeker?
  #   @address = seeker.address.new
  # end

  def new
    @address = Address.new
  end

  def create
    @seeker = current_user if current_user.seeker?
    @address = @seeker.create_address(address_params)
    if @address.save
      redirect_to users_profile_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @address = current_user.address
  end

  def update
    @address = current_user.address

    if @address.update(address_params)
      redirect_to users_profile_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def address_params
      params.require(:address).permit(:street, :city, :pincode)
    end
end
