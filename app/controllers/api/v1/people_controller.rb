class Api::V1::PeopleController < ApplicationController
  before_filter :search_people

  def index
    render json: {
      people: @people,
      meta: {
        current_page: @people.current_page,
        next_page: @people.next_page,
        prev_page: @people.prev_page,
        total_pages: @people.total_pages,
        total_count: @people.total_count
      }
    }
  end

  def show
    person = Person.find params[:id]

    render json: person
  end

  private

  def search_people
    @people =  if params[:search].present?
      Person.search(params[:search])
    else
      Person.all
    end.sorted.page(params[:page])
  end
end
