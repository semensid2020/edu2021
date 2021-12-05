class PredmetsController < ApplicationController

  def index
    @predmets = Predmet.all
  end

  def show
    @predmets = []
    u = current_user
    study_groups = u.study_groups

    study_groups.each do |gr|
      @predmets.push gr.predmet
    end

    render 'predmets/no_predmets' if @predmets.blank?
    @predmets
  end

end
