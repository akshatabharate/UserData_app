class Api::V1::UsersController < ApplicationController

before_action :getUser , only: [:updateUser, :deleteUser, :showUser]
#get
 def getUsers
        user = User.all

        if user
            render json: user, status: :ok
        else
            render json: {message: "user not added"}, status: :unprocessable_entity
        end 
 end
#post
 def addUser
       user = User.new(userparams)

       if user.save()
          render json: user, status: :ok
        
       else
          render json: {message: "user not added"}, status: :unprocessable_entity
        
       end

 end

 #show

    def showUser
        if  @user 
            
            render json: @user, status: :ok
            
        else
            render json: {message: "user not found"}, status: :unprocessable_entity
        end
    end

 #put
    def updateUser
       if  @user 
           if @user.update(userparams)

             render json: @user, status: :ok

           else

             render json: {message: "update failed"}, status: :unprocessable_entity

           end
        else
            render json: {message: "user not found"}, status: :unprocessable_entity
        end
    end
 #delete
    def deleteUser
        if  @user 
            if @user.destroy()
              render json: { message: "user deleted"}, status: :ok
            else
              render json: {message: "update failed"}, status: :unprocessable_entity
            end
        else
             render json: {message: "user not found"}, status: :unprocessable_entity
        end


    end

    #search
     
    def searchUser
        # if params[:input].blank?
        #     render json: user = User.all , status: :ok
        # else
            
            
             @parameter = params[:input]
            #@results= User.where(firstName: /#{@parameter}/i).union.in(lastName: /#{@parameter}/i).to_a
            @results= User.or({firstName: /#{@parameter}/i}, {lastName: /#{@parameter}/i},{email: /#{@parameter}/i})
            
            #  @results=User.where('$text' => {'$search' => 'albert'}).to_a
            #@results = User.where('text' => "#{@parameter}").to_a 
            
            render json: @results, status: :ok
            
           
        
    end


 private
  
    def userparams
        params.permit(:firstName, :lastName , :email)
    end

    def getUser
        @user = User.find(params[:id])
    end

end
