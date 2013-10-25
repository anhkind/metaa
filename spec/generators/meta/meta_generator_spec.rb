require 'spec_helper'
require 'rails'
require 'ammeter/init'
require 'generators/rails/meta_generator'

describe Rails::Generators::MetaGenerator do
  destination File.expand_path("../tmp", __FILE__)

  before { prepare_destination }
  after(:all) { FileUtils.rm_rf destination_root }

  describe "the generated meta" do
    subject { file("app/meta/your_model_meta.rb") }

    describe "naming" do
      before { run_generator %w(YourModel) }

      it { should contain "class YourModelMeta" }
    end

    describe "namespacing" do
      subject { file("app/meta/namespace/your_model_meta.rb") }
      before { run_generator %w(Namespace::YourModel) }

      it { should contain "class Namespace::YourModelMeta" }
    end

    describe "inheritance" do
      context "by default" do
        before { run_generator %w(YourModel) }

        it { should contain "class YourModelMeta < Metaa::Meta" }
      end

      context "with the --parent option" do
        before { run_generator %w(YourModel --parent=FooMeta) }

        it { should contain "class YourModelMeta < FooMeta" }
      end

      context "with an ApplicationMeta" do
        before do
          Object.any_instance.stub(:require).with("application_meta").and_return do
            stub_const "ApplicationMeta", Class.new
          end
        end

        before { run_generator %w(YourModel) }

        it { should contain "class YourModelMeta < ApplicationMeta" }
      end
    end
  end
end