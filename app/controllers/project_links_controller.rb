


class ProjectLinksController < ApplicationController
 	def submissions
  		ordering = params[:order] || 'hot'
  		order  = case ordering
              	  when 'hot' then 'points DESC'
              	  when 'new' then 'created_at DESC'
                end
  		# @link_pages, @links = Projects.paginate :page=>params[:page], :order=> order, :per_page => 20
  		@header_text = case ordering
			  when 'hot' then 'Top rated submissions'
			  when 'new' then 'Latest submissions'
      end
  end

	def modify_points
		@link = Link.find(params[:id])
		@link.update_attribute :points, @link.points + params[:by].to_i if params[:by] =~ /[+|-]?1/
		render_text @link.points
  end
	def new
	end
end
