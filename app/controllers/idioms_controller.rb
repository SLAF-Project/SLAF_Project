class IdiomsController < ApplicationController

  def show
    @idiom = Idiom.find(params[:id])
  end

  def index
    @letters = *('A'..'Z')
    @idioms_letter = Idiom.by_letter(params[:letter])
    @pagy, @idioms = pagy(@idioms_letter.order(created_at: :desc))
  end

  def new
    @idiom = Idiom.new()
  end

  def create
    @idiom = Idiom.create(title_en: params[:idioms][:title_en], title_fr: params[:idioms][:title_fr],
      grammatical_type: params[:idioms][:grammatical_type], body: params[:idioms][:body], example: params[:idioms][:example], user: current_user)

    if @idiom.save
      flash[:success] = 'Ton expression est désormais en cours de validation !'
      redirect_to idiom_path(@idiom.id)
    else
    flash.now[:error] = @user.errors.full_messages.to_sentence
    render :new
    end
  end

  def update
    @idiom = Idiom.find(params[:id])
    puts params
      if @idiom.update(title_en: params[:idiom][:title_en], title_fr: params[:idiom][:title_fr],
        grammatical_type: params[:idiom][:grammatical_type], body: params[:idiom][:body], example: params[:idiom][:example], user: current_user)
      redirect_to idiom_path(@idiom.id)
      else
      redirect_to idiom_path(@idiom.id)
      end
    end

  def destroy
    @idiom = Idiom.find(params[:id])
    @idiom.destroy
    redirect_back(fallback_location: root_path)
  end

private

end