class TheBulletGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  class_option :base, type: :boolean, default: true, desc: 'Generate base stuff. Base controller and views.'

  # class_option :sign_up, type: :boolean, default: true, desc: 'Generate user sign up feature'
  #
  # class_option :sign_in, type: :boolean, default: true, desc: 'Generate user sign in feature'
  #
  # class_option :sign_out, type: :boolean, default: true, desc: 'Generate user sign out feature'
  #
  # class_option :password_reset, type: :boolean, default: true, desc: 'Generate user password reset feature'
  #
  # class_option :profile, type: :boolean, default: true, desc: 'Generate user profile'
  #
  # class_option :pundit, type: :boolean, default: true, desc: 'Generate pundit stuff'
  #
  # class_option :swagger, type: :boolean, default: true, desc: 'Generate Swagger documentation'
  #
  # class_option :backoffice, type: :boolean, default: true, desc: 'Generate Backoffice'
  #
  # class_option :backoffice_users, type: :boolean, default: true, desc: 'Generate Backoffice users'

  class_option :rspec, type: :boolean, default: true, desc: 'Generate RSpec specs'

  def copy_base_views
    if options[:base]
      copy_file 'app/views/api/base/index.json.erb', 'app/views/api/base/index.json.erb'
      copy_file 'app/views/api/base/show.json.erb', 'app/views/api/base/show.json.erb'
      copy_file 'app/views/api/base/create.json.erb', 'app/views/api/base/create.json.erb'
      copy_file 'app/views/api/base/update.json.erb', 'app/views/api/base/update.json.erb'
      copy_file 'app/views/api/base/errors.json.erb', 'app/views/api/base/errors.json.erb'
      copy_file 'app/views/api/base/exception.json.erb', 'app/views/api/base/exception.json.erb'
    end
  end

  def copy_user_model
    if options[:base]
      copy_file 'app/models/user.rb', 'app/models/user.rb'
      copy_file 'app/decorators/user_decorator.rb', 'app/decorators/user_decorator.rb'
      copy_file 'app/models/session.rb', 'app/models/session.rb'
      copy_file 'app/decorators/session_decorator.rb', 'app/decorators/session_decorator.rb'
      if options[:rspec]
        copy_file 'spec/models/user_spec.rb', 'spec/models/user_spec.rb'
        copy_file 'spec/decorators/user_decorator_spec.rb', 'spec/decorators/user_decorator_spec.rb'
        copy_file 'spec/models/session_spec.rb', 'spec/models/session_spec.rb'
        copy_file 'spec/decorators/session_decorator_spec.rb', 'spec/decorators/session_decorator_spec.rb'
      end
    end
  end

  def create_base_controller
    if options[:base]
      template('app/controllers/api/base_controller.rb.erb', 'app/controllers/api/base_controller.rb')
      if options[:rspec]
        template('spec/controllers/api/base_controller_spec.rb.erb', 'spec/controllers/api/base_controller_spec.rb')
      end
    end
  end

  # def generate_base_controller
  #   puts "generate base controller"
  # end
  #
  # def generate_sign_ups_controller
  #   puts "generate sign ups controller"
  # end
  #
  # def generate_sign_ins_controller
  #   puts "generate sign ins controller"
  # end
  #
  # def generate_sign_outs_controller
  #   puts "generate sign outs controller"
  # end
  #
  # def generate_pundit
  #   puts "generate pundit stuff"
  # end
  #
  # def swagger
  #   puts "generate swagger stuff"
  # end
end
