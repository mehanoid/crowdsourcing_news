require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe NewsItemsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # NewsItem. As you add validations to NewsItem, be sure to
  # adjust the attributes here as well.

  let(:category) { create(:news_category) }

  let(:valid_attributes) {
    attributes_for(:news_item).merge(category_ids: [category.id])
  }

  let(:invalid_attributes) {
    {title: '', body: ''}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NewsItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all news_items as @news_items' do
      news_item = create(:news_item)
      get :index, {}, valid_session
      expect(assigns(:news_items)).to eq([news_item])
    end

    context 'if category specified' do
      it 'assigns items from category as @news_items' do
        news_item = create(:news_item)
        news_item_from_category = create(:news_item, category_ids: category.id)
        get :index, {news_category_id: category.id}, valid_session
        expect(assigns(:news_items)).to eq([news_item_from_category])
      end
    end
  end

  describe 'GET show' do
    it 'assigns the requested news_item as @news_item' do
      news_item = create(:news_item)
      get :show, {:id => news_item.to_param}, valid_session
      expect(assigns(:news_item)).to eq(news_item)
    end
  end

  describe 'GET new' do
    before { sign_in create(:user) }
    it 'assigns a new news_item as @news_item' do
      get :new, {}, valid_session
      expect(assigns(:news_item)).to be_a_new(NewsItem)
    end
  end

  describe 'GET edit' do
    let(:user) { create(:user) }
    before { sign_in user }
    let!(:news_item) { create(:news_item, user: user) }

    it 'assigns the requested news_item as @news_item' do
      get :edit, {:id => news_item.to_param}, valid_session
      expect(assigns(:news_item)).to eq(news_item)
    end
  end

  describe 'POST create' do
    context 'user is signed in' do
      before { sign_in create(:user) }
      describe 'with valid params' do
        it 'creates a new NewsItem' do
          expect {
            post :create, {news_item: valid_attributes}, valid_session
          }.to change(NewsItem, :count).by(1)
        end

        it 'assigns a newly created news_item as @news_item' do
          post :create, {:news_item => valid_attributes}, valid_session
          expect(assigns(:news_item)).to be_a(NewsItem)
          expect(assigns(:news_item)).to be_persisted
        end

        it 'redirects to the created news_item' do
          post :create, {:news_item => valid_attributes}, valid_session
          expect(response).to redirect_to(NewsItem.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved news_item as @news_item' do
          post :create, {:news_item => invalid_attributes}, valid_session
          expect(assigns(:news_item)).to be_a_new(NewsItem)
        end

        it "re-renders the 'new' template" do
          post :create, {:news_item => invalid_attributes}, valid_session
          expect(response).to render_template('new')
        end
      end
    end
    context 'user is not signed in' do
      it 'creates a new NewsItem' do
        expect {
          post :create, {news_item: valid_attributes}, valid_session
        }.to raise_error CanCan::AccessDenied
      end
    end
  end

  describe 'PUT update' do
    let(:user) { create(:user) }
    before { sign_in user }
    context 'news item was created by current user' do
      let!(:news_item) { create(:news_item, user: user) }
      describe 'with valid params' do
        let(:new_attributes) {
          {body: 'test'}
        }

        it 'updates the requested news_item' do
          put :update, {:id => news_item.to_param, :news_item => new_attributes}, valid_session
          news_item.reload
          expect(news_item.body).to eq 'test'
        end

        it 'assigns the requested news_item as @news_item' do
          put :update, {:id => news_item.to_param, :news_item => valid_attributes}, valid_session
          expect(assigns(:news_item)).to eq(news_item)
        end

        it 'redirects to the news_item' do
          put :update, {:id => news_item.to_param, :news_item => valid_attributes}, valid_session
          expect(response).to redirect_to(news_item)
        end
      end

      describe 'with invalid params' do
        it 'assigns the news_item as @news_item' do
          put :update, {:id => news_item.to_param, :news_item => invalid_attributes}, valid_session
          expect(assigns(:news_item)).to eq(news_item)
        end

        it "re-renders the 'edit' template" do
          put :update, {:id => news_item.to_param, :news_item => invalid_attributes}, valid_session
          expect(response).to render_template('edit')
        end
      end
    end

    context 'news item was created by another user' do
      let!(:news_item) { create(:news_item) }

      it 'raises AccessDenied' do
        expect {
          put :update, {:id => news_item.to_param, news_item: {body: 'test'}}, valid_session
        }.to raise_error CanCan::AccessDenied
      end
    end
  end

  describe 'DELETE destroy' do
    let(:user) { create(:user) }
    before { sign_in user }

    context 'news item was created by current user' do
      let!(:news_item) { create(:news_item, user: user) }

      it 'destroys the requested news_item' do
        expect {
          delete :destroy, {:id => news_item.to_param}, valid_session
        }.to change(NewsItem, :count).by(-1)
      end

      it 'redirects to the news_items list' do
        delete :destroy, {:id => news_item.to_param}, valid_session
        expect(response).to redirect_to(news_items_url)
      end
    end

    context 'news item was created by another user' do
      let!(:news_item) { create(:news_item) }

      it 'raises AccessDenied' do
        expect {
          delete :destroy, {:id => news_item.to_param}, valid_session
        }.to raise_error CanCan::AccessDenied
      end
    end
  end

end
