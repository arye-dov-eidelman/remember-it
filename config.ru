require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use UserController

# this line can be removed without any affect as it's inherited in  all Curriculum Controllers
use CurriculumController
use CurriculumTrackController
use CurriculumChapterController
use LearnController
run ApplicationController
