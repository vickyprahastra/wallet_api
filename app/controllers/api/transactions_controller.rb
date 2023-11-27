module Api
  class TransactionsController < Api::ApiController

    def transfer
      return warning_response("User with id doesn`t exist") unless receiver.present?

      return warning_response("Can not transfer to your own id") if current_user.id == receiver.id

      return warning_response("Please fill the amount") unless amount.present?

      result = current_user.transfer(amount, receiver)
      render json: result
    end

    def withdraw
      result = current_user.withdraw(amount)
      render json: result
    end

    private

    def amount
      @amount ||= transaction_params[:amount]
    end

    def receiver
      @receiver ||= User.where(id: transaction_params[:receiver_id]).first
    end

    def transaction_params
      params.require(:transaction).permit(:amount, :receiver_id)
    end

  end
end
