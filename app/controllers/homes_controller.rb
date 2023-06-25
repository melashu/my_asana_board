require 'json'
class HomesController < ApplicationController
  include ApiForAsana
  def index
    @code = get_sections.code
    @body = JSON.parse(get_sections.body)
  end
  
  def edit
    @id = params[:id]
  end

  def new
  end

  def edit_task
      @id = params[:id]
  end

    def create
        name = params[:name]
        res = create_section(name)
        if res.code == '201'
          redirect_to get_sections_path, notice: 'Successfuly create section!'
        else
          data = JSON.parse(res.body)
          redirect_to get_sections_path, alert: "#{data["errors"][0]["message"]}"
        end
    end

    def destroy
      id = params[:id]
      res = delete_section(id)
      if res.code == '200'
        redirect_to get_sections_path, notice: 'Successfuly delete section!'
      else
        data = JSON.parse(res.body)
        redirect_to get_sections_path, alert: "Error happened #{data["errors"][0]["message"]}"
      end
    end


    def update
      id = params[:id]
      name = params[:name]
      res = update_section(id, name)
      if res.code == '200'
        redirect_to get_sections_path, notice: "Successfuly update your section to #{name}"
      else
        data = JSON.parse(res.body)
        redirect_to get_sections_path, alert: "#{data["errors"][0]["message"]}"
      end
    end 

    def update_section_task
      id = params[:id]
      name = params[:name]
      res = update_task(id, name)
      if res.code == '200'
        redirect_to get_sections_path, notice: "Successfuly update your task to #{name}"
      else
        data = JSON.parse(res.body)
        redirect_to get_sections_path, alert: "#{data["errors"][0]["message"]}"
      end
    end
end