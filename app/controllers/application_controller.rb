class ApplicationController < ActionController::Base
    def hello
    render html: "hello, task manager!"
    end
end
