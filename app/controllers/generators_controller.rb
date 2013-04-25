# encoding: utf-8
class GeneratorsController < ApplicationController

  def generate
    def srav?(lin)
      reg = ['р','х','ф','щ','и','я','у','о','д']
      reg1 = reg & lin.split('')
      if reg1.size > 3
        return true
      end
    end

    f = File.new("SLOVA.TXT")
    while line = f.gets
      line1 = line.chomp
      #po = (line =~/\A[батя]$\z/)
      if  line1.length == 4 and srav?(line1)
        #i = line.to_s.length
       # + i.to_s line.length == 6 and
      end
    end
    f.close
  end

  def create
    render :text => params[:post].inspect
  end

end