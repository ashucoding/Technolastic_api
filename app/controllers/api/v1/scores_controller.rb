class Api::V1::ScoresController < ApplicationController
    def index
        @scores = Score.all.order(body: :desc).limit(5)

        render json: @scores.as_json(include: :user), status: 200
    end

    def create
        user = User.find_or_create_by(username: score_params[:username])
        @score = Score.create(user_id: user.id, body: score_params[:score])

        render json: @score, status: 200
    end

    def show
        @score = Score.find(params{:id})

        render json: @score, status: 200
    end

    def update
        @score = Score.find(params{:id})
        @score.update(score_params)

        render json: @score, status: 200

    end

    def destroy
        @score = Score.find(params{:id})
        @score.delete
        render json: {scoreID: @score.id}
    end

    private 

    def score_params
        params.permit(:username, :score) # {username: "", score: 4}
    end

end
