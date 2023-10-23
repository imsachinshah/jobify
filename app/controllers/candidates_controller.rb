class CandidatesController < ApplicationController
  def index
    @candidates = AppliedJob.all
  end
end
