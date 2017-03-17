class TheBulletGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  class_option :base, type: :boolean, default: true, desc: 'Generate base stuff. Base controller and views.'

  # class_option :authentication, type: :boolean, default: true, desc: 'Add authentication'
  #
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

  class_option :backoffice, type: :boolean, default: true, desc: 'Generate Backoffice'

  class_option :backoffice_user_management, type: :boolean, default: true, desc: 'Generate Backoffice users'

  class_option :rspec, type: :boolean, default: true, desc: 'Generate RSpec specs'

  def create_api_base_views
    if options[:base]
      copy_file 'app/views/api/base/index.json.erb', 'app/views/api/base/index.json.erb'
      copy_file 'app/views/api/base/show.json.erb', 'app/views/api/base/show.json.erb'
      copy_file 'app/views/api/base/create.json.erb', 'app/views/api/base/create.json.erb'
      copy_file 'app/views/api/base/update.json.erb', 'app/views/api/base/update.json.erb'
      copy_file 'app/views/api/base/errors.json.erb', 'app/views/api/base/errors.json.erb'
      copy_file 'app/views/api/base/exception.json.erb', 'app/views/api/base/exception.json.erb'
    end
  end

  def create_backoffice_base_views
    if options[:backoffice]
      copy_file 'app/views/backoffice/base/index.json.erb', 'app/views/backoffice/base/index.json.erb'
      copy_file 'app/views/backoffice/base/show.json.erb', 'app/views/backoffice/base/show.json.erb'
      copy_file 'app/views/backoffice/base/create.json.erb', 'app/views/backoffice/base/create.json.erb'
      copy_file 'app/views/backoffice/base/update.json.erb', 'app/views/backoffice/base/update.json.erb'
      copy_file 'app/views/backoffice/base/errors.json.erb', 'app/views/backoffice/base/errors.json.erb'
      copy_file 'app/views/backoffice/base/exception.json.erb', 'app/views/backoffice/base/exception.json.erb'
    end
  end

  def create_api_base_models
    if options[:base]
      copy_file 'app/models/user.rb', 'app/models/user.rb'
      copy_file 'app/models/session.rb', 'app/models/session.rb'
      if options[:rspec]
        copy_file 'spec/models/user_spec.rb', 'spec/models/user_spec.rb'
        copy_file 'spec/models/session_spec.rb', 'spec/models/session_spec.rb'
      end
    end
  end

  def create_api_base_decorators
    if options[:base]
      copy_file 'app/decorators/user_decorator.rb', 'app/decorators/user_decorator.rb'
      copy_file 'app/decorators/session_decorator.rb', 'app/decorators/session_decorator.rb'
      if options[:rspec]
        copy_file 'spec/decorators/user_decorator_spec.rb', 'spec/decorators/user_decorator_spec.rb'
        copy_file 'spec/decorators/session_decorator_spec.rb', 'spec/decorators/session_decorator_spec.rb'
      end
    end
  end

  def create_backoffice_models
    if options[:backoffice]
      copy_file 'app/models/backoffice.rb', 'app/models/backoffice.rb'
      copy_file 'app/models/backoffice/superuser.rb', 'app/models/backoffice/superuser.rb'
      copy_file 'app/models/backoffice/session.rb', 'app/models/backoffice/session.rb'
      if options[:rspec]
        copy_file 'spec/models/backoffice_spec.rb', 'spec/models/backoffice_spec.rb'
        copy_file 'spec/models/backoffice/superuser_spec.rb', 'spec/models/backoffice/superuser_spec.rb'
        copy_file 'spec/models/backoffice/session_spec.rb', 'spec/models/backoffice/session_spec.rb'
        copy_file 'spec/factories/backoffice/superusers.rb', 'spec/factories/backoffice/superusers.rb'
        copy_file 'spec/factories/backoffice/sessions.rb', 'spec/factories/backoffice/sessions.rb'
      end
    end
  end

  def create_backoffice_decorators
    if options[:backoffice]
      # copy_file 'app/decorators/backoffice/superuser_decorator.rb', 'app/decorators/backoffice/superuser_decorator.rb'
      copy_file 'app/decorators/backoffice/session_decorator.rb', 'app/decorators/backoffice/session_decorator.rb'
      if options[:rspec]
        # copy_file 'spec/decorators/backoffice/superuser_decorator_spec.rb', 'spec/decorators/backoffice/superuser_decorator_spec.rb'
        copy_file 'spec/decorators/backoffice/session_decorator_spec.rb', 'spec/decorators/backoffice/session_decorator.rb'
      end
    end
  end

  def create_api_base_controller
    if options[:base]
      template('app/controllers/api/base_controller.rb.erb', 'app/controllers/api/base_controller.rb')
      if options[:rspec]
        copy_file 'spec/factories/users.rb', 'spec/factories/users.rb'
        copy_file 'spec/factories/sessions.rb', 'spec/factories/sessions.rb'
        template('spec/controllers/api/base_controller_spec.rb.erb', 'spec/controllers/api/base_controller_spec.rb')
      end
    end
  end

  def create_backoffice_base_controller
    if options[:backoffice]
      copy_file 'app/controllers/backoffice/base_controller.rb', 'app/controller/backoffice/base_controller.rb'
      if options[:rspec]
        copy_file 'spec/controllers/backoffice/base_controller_spec.rb', 'spec/controllers/backoffice/base_controller_spec.rb'
      end
    end
  end

  def create_backoffice_sign_ins_controller
    if options[:backoffice]
      copy_file 'app/controllers/backoffice/sign_ins_controller.rb', 'app/controllers/backoffice/sign_ins_controller.rb'
      copy_file 'app/services/backoffice/sign_in.rb', 'app/services/backoffice/sign_in.rb'
      if options[:rspec]
        copy_file 'spec/controllers/backoffice/sign_ins_controller_spec.rb', 'spec/controllers/backoffice/sign_ins_controller_spec.rb'
        copy_file 'spec/services/backoffice/sign_in_spec.rb', 'spec/services/backoffice/sign_in_spec.rb'
        copy_file 'spec/spec/routing/backoffice/sign_ins_routing_spec.rb', 'spec/spec/routing/backoffice/sign_ins_routing_spec.rb'
      end
    end
  end

  def create_backoffice_sign_outs_controller
    if options[:backoffice]
      copy_file 'app/controllers/backoffice/sign_outs_controller.rb', 'app/controllers/backoffice/sign_outs_controller.rb'
      copy_file 'app/services/backoffice/sign_out.rb', 'app/services/backoffice/sign_out.rb'
      if options[:rspec]
        copy_file 'spec/controllers/backoffice/sign_outs_controller_spec.rb', 'spec/controllers/backoffice/sign_outs_controller_spec.rb'
        copy_file 'spec/services/backoffice/sign_out_spec.rb', 'spec/services/backoffice/sign_out_spec.rb'
        copy_file 'spec/spec/routing/backoffice/sign_outs_routing_spec.rb', 'spec/spec/routing/backoffice/sign_outs_routing_spec.rb'
      end
    end
  end

  def create_backoffice_users_controller
    if options[:backoffice] && options[:backoffice_user_management]
      copy_file 'app/models/backoffice/user.rb', 'app/models/backoffice/user.rb'
      copy_file 'app/decorators/backoffice/user_decorator.rb', 'app/decorators/backoffice/user_decorator.rb'
      copy_file 'app/controllers/backoffice/users_controller.rb', 'app/controllers/backoffice/users_controller.rb'
      if options[:rspec]
        copy_file 'spec/models/backoffice/user_spec.rb', 'spec/models/backoffice/user_spec.rb'
        copy_file 'spec/decorators/backoffice/user_decorator_spec.rb', 'spec/decorators/backoffice/user_decorator_spec.rb'
        copy_file 'spec/controllers/backoffice/users_controller_spec.rb', 'spec/controllers/backoffice/users_controller.rb'
        copy_file 'spec/spec/routing/backoffice/users_routing_spec.rb', 'spec/spec/routing/backoffice/users_routing_spec.rb'
      end
    end
  end
end
