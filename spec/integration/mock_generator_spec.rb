require 'spec_helper'

if ORM.has(:mongoid)
  describe Promiscuous::Publisher::MockGenerator do
    before { load_models }
    before { load_mocks }
    before { use_null_backend { |config| config.app = 'test_publisher' } }

    subject { Promiscuous::Publisher::MockGenerator }

    it "generates mocks" do
      subject.generate.should == <<-MOCKS.gsub(/^ {6}/, '')
      # ---------------------------------
      # Auto-generated file. Do not edit.
      # ---------------------------------

      module TestPublisher::Publishers
        module Scoped; end

        # ------------------------------------------------------------------

        class PublisherModel
          include Promiscuous::Publisher::Model::Mock
          mock :from => 'test_publisher'
          mock :id => :bson

          publish :field_1
          publish :field_2
          publish :field_3
        end
        class PublisherModelAnotherChild < PublisherModel
          publish :another_child_field_1
          publish :another_child_field_2
          publish :another_child_field_3
        end
        class PublisherModelChild < PublisherModel
          publish :child_field_1
          publish :child_field_2
          publish :child_field_3
        end
        class PublisherModelChildOfChild < PublisherModelChild
          publish :child_of_child_field_1
        end
        class Scoped::ScopedPublisherModel < PublisherModel
        end

        # ------------------------------------------------------------------

        class IndexedPublisherModel
          include Promiscuous::Publisher::Model::Mock
          mock :from => 'test_publisher'
          mock :id => :bson

          publish :field_1
        end

        # ------------------------------------------------------------------

        class PublisherModelOther
          include Promiscuous::Publisher::Model::Mock
          mock :from => 'test_publisher'
          mock :id => :bson

          publish :field_1
          publish :field_2
          publish :field_3
        end

        # ------------------------------------------------------------------

        class PublisherModelEmbedded
          include Promiscuous::Publisher::Model::Mock
          mock :from => 'test_publisher'
          mock :id => :bson

          publish :embedded_field_1
          publish :embedded_field_2
          publish :embedded_field_3
        end
        class PublisherModelEmbeddedChild < PublisherModelEmbedded
          publish :child_embedded_field_1
          publish :child_embedded_field_2
          publish :child_embedded_field_3
        end

        # ------------------------------------------------------------------

        class PublisherModelEmbed
          include Promiscuous::Publisher::Model::Mock
          mock :from => 'test_publisher'
          mock :id => :bson

          publish :field_1
          publish :field_2
          publish :field_3
          publish :model_embedded
        end

        # ------------------------------------------------------------------

        class PublisherModelEmbedMany
          include Promiscuous::Publisher::Model::Mock
          mock :from => 'test_publisher'
          mock :id => :bson

          publish :field_1
          publish :field_2
          publish :field_3
          publish :models_embedded
        end

        # ------------------------------------------------------------------

        class PublisherModelBelongsTo
          include Promiscuous::Publisher::Model::Mock
          mock :from => 'test_publisher'
          mock :id => :bson

          publish :publisher_model_id
        end

        # ------------------------------------------------------------------

        class PublisherModelWithoutSubscriber
          include Promiscuous::Publisher::Model::Mock
          mock :from => 'test_publisher'
          mock :id => :bson

          publish :field_1
        end
      end
      MOCKS
    end
  end
end
