class RequestsController < ApplicationController
  before_action :check_uuid
  def create
    request = Request.find_by(source_uuid: params['source_uuid'])
    if request.present?
      request.update(request_params)
    else
      request = request.create(request_params)
    end
    render json: {data: request.as_json, status: 200}
  end

  def show
    render json: {data: 'test'}
  end

  private
  def check_uuid
    return invalid_params if params['source_uuid'].nil? || params['post_raw_data'].nil?
    return unauthorized unless uuid_keys.include?(params['source_uuid'])
  end

  def uuid_keys
    ENV['UUIDS'].split(',').map(&:strip)
  end

  def invalid_params
    render json: {error: 'Invalid params request', status: 500}
  end

  def unauthorized
    render json: {error: 'Unauthorized request', status: 401}
  end

  def request_params
    params.require(:request).permit(:bk_organization_id, :source_uuid, :transactions_summarized_count, :status, :json_diff,
                                   :summarized_net_sales, :journal_entry_template, :connection_id, :short_summary,
                                   :apify_run_url, :source_raw_data, :bk_external_id, post_raw_data: {})
  end
end
