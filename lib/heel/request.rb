#--
# Copyright (c) 2007, 2008 Jeremy Hinegardner
# All rights reserved.  Licensed under the BSD license.  See LICENSE for details
#++
#
require 'rack'
module Heel
  # nothing more than a rack request with some additional methods and overriding
  # where the erros get written
  class Request < ::Rack::Request

    attr_reader :root_dir

    # Initialize the request with the environment and the root directory of the
    # request 
    def initialize(env, root_dir)
      super(env)
      @root_dir = root_dir
    end

    # a stat of the file mentioned in the request path
    #
    def stat
      @stat ||= ::File.stat(request_path) 
    end

    # normalize the request path to the full file path of the request from the
    # +root_dir+
    #
    def request_path
      @request_path ||= ::File.expand_path(::File.join(root_dir, ::Rack::Utils.unescape(path_info)))
    end

    # 
    def base_uri
      @base_uri ||= ::Rack::Utils.unescape(path_info)
    end


    # a request must be for something that below the root directory
    #
    def forbidden?
      request_path.index(root_dir) != 0
    end

    # a request is only good for something that actually exists and is readable
    #
    def found?
      File.exist?(request_path) and (stat.directory? or stat.file?) and stat.readable?
    end

    def for_directory?
      stat.directory?
    end

    def for_file?
      stat.file?
    end

    # was the highlighting parameter true or false?
    #
    def highlighting?
      return !(%w[ off false ].include? self.GET['highlighting'].to_s.downcase)
    end
  end
end
