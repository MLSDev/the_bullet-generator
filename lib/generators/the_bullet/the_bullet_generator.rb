class TheBulletGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  class_option :base_controller, type: :boolean, default: true, desc: 'Generate BaseController'

  class_option :sign_up, type: :boolean, default: true, desc: 'Generate SignUpsController'

  class_option :sign_in, type: :boolean, default: true, desc: 'Generate SignInsController'

  class_option :sign_out, type: :boolean, default: true, desc: 'Generate SignOutsController'

  class_option :pundit, type: :boolean, default: true, desc: 'Generate pundit stuff'

  class_option :swagger, type: :boolean, default: true, desc: 'Generate Swagger documentation'

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
