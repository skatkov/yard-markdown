# Class: RDoc::RI::Task
**Inherits:** RDoc::Task
    

RDoc::RI::Task creates ri data in `./.rdoc` for your project.

It contains the following tasks:

ri
:   Build ri data


clobber_ri
:   Delete ri data files.  This target is automatically added to the main
    clobber target.


reri
:   Rebuild the ri data from scratch even if they are not out of date.


Simple example:

    require 'rdoc/ri/task'

    RDoc::RI::Task.new do |ri|
      ri.main = 'README.rdoc'
      ri.rdoc_files.include 'README.rdoc', 'lib/**/*.rb'
    end

For further configuration details see RDoc::Task.



#Instance Methods
## clobber_task_description() [](#method-i-clobber_task_description)
:nodoc:

## defaults() [](#method-i-defaults)
Sets default task values

## initialize(nameDEFAULT_NAMES) [](#method-i-initialize)
Create an ri task with the given name. See RDoc::Task for documentation on
setting names.

**@return** [Task] a new instance of Task

## rdoc_task_description() [](#method-i-rdoc_task_description)
:nodoc:

## rerdoc_task_description() [](#method-i-rerdoc_task_description)
:nodoc:

