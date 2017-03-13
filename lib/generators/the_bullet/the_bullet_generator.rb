class TheBulletGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  class_option :base, type: :boolean, default: true, desc: 'Generate base stuff. Base controller and views.'

  class_option :sign_up, type: :boolean, default: true, desc: 'Generate user sign up feature'

  class_option :sign_in, type: :boolean, default: true, desc: 'Generate user sign in feature'

  class_option :sign_out, type: :boolean, default: true, desc: 'Generate user sign out feature'

  class_option :password_reset, type: :boolean, default: true, desc: 'Generate user password reset feature'

  class_option :profile, type: :boolean, default: true, desc: 'Generate user profile'

  class_option :pundit, type: :boolean, default: true, desc: 'Generate pundit stuff'

  class_option :swagger, type: :boolean, default: true, desc: 'Generate Swagger documentation'

  class_option :backoffice, type: :boolean, default: true, desc: 'Generate Backoffice'

  class_option :backoffice_users, type: :boolean, default: true, desc: 'Generate Backoffice users'

  class_option :rspec, type: :boolean, default: true, desc: 'Generate RSpec specs'

  def generate_base_controller
    puts "generate base controller"
  end

  def generate_sign_ups_controller
    puts "generate sign ups controller"
  end

  def generate_sign_ins_controller
    puts "generate sign ins controller"
  end

  def generate_sign_outs_controller
    puts "generate sign outs controller"
  end

  def generate_pundit
    puts "generate pundit stuff"
  end

  def swagger
    puts "generate swagger stuff"
  end
end
