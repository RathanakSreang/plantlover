require 'google/apis/drive_v2'
require 'google/api_client/client_secrets'

require 'googleauth'
require 'googleauth/stores/redis_token_store'

class MyDrive
  OOB_URI = "http://www.tobnhom.com/oauth2callback"
  attr_writer :authorizer, :drive, :redirect_uri, :credentials

  def initialize
    client_id = Google::Auth::ClientId.from_file("#{Rails.root}/lib/google_drive/client_secret.json")
    scope = ['https://www.googleapis.com/auth/drive']
    token_store = Google::Auth::Stores::RedisTokenStore.new(redis: $redis)
    @authorizer = Google::Auth::UserAuthorizer.new(
    client_id, scope, token_store)
    user_id = 'plantlover'
    @credentials = @authorizer.get_credentials(user_id)
    @drive = Google::Apis::DriveV2::DriveService.new
    @drive.authorization = @credentials
  end

  def authorization_url
    @authorizer.get_authorization_url(base_url: OOB_URI)
  end

  def get_credentials
    @credentials
  end

  def set_authorization
    @drive.authorization = @credentials
  end

  def get_drive
    @drive
  end

  def save_credentials(code)
    user_id = 'plantlover'
    @credentials = @authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
    @drive.authorization = @credentials
  end

  def list_files(options = {})
    @drive.list_files(options: options)
  end

  def upload(file, options = {})
    # file[:parent_ids] = [{id: 'id'}]
    file_obj = Google::Apis::DriveV2::File.new({
      title: file[:title],
      parents: file[:parent_ids]
    })
    f = @drive.insert_file(file_obj, upload_source: file[:path])
    f.id
  rescue
    nil
  end

  def delete(id, options = {})
    @drive.delete_file(id)
  end

  def update(id, file, options = {})
    @drive.patch_file(id, file)
  end

  def get(id, options = {})
    @drive.get_file(id)
  end

  def list_children_files(parent_id, options = {})
    @drive.list_children(parent_id, options: options).items
  end
end
