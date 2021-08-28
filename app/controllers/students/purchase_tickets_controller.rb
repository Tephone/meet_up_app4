class Students::PurchaseTicketsController < ApplicationController
  def new
    @purchase_ticket = current_student.purchase_tickets.new
  end
  
  def create
    @purchase_ticket = current_student.purchase_tickets.new(purchase_ticket_params)
    if @purchase_ticket.save
      redirect_to student_path(current_student), notice: 'チケットを購入しました'
    else
      render :new
    end
  end

  private

  def purchase_ticket_params
    params.require(:purchase_ticket).permit %i[student_id ticket_id deadline]
  end
end
