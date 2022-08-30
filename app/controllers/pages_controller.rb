class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profil
  end

  def main
  end

  def start_intro
  end

  def start_monster
  end

  def start_tutoriel
  end
end
