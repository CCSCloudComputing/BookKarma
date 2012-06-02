class BookCatalogEntriesController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @book_catalog_entries = BookCatalogEntrie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_catalog_entries }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book_catalog_entrie = BookCatalogEntrie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_catalog_entrie }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book_catalog_entrie = BookCatalogEntrie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_catalog_entrie }
    end
  end

  # GET /books/1/edit
  def edit
    @book_catalog_entrie = BookCatalogEntrie.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book_catalog_entrie = BookCatalogEntrie.new(params[:book_catalog_entrie])

    respond_to do |format|
      if @book_catalog_entrie.save
        format.html { redirect_to @book_catalog_entrie, notice: 'Book was successfully created.' }
        format.json { render json: @book_catalog_entrie, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book_catalog_entrie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book_catalog_entrie = BookCatalogEntrie.find(params[:id])

    respond_to do |format|
      if @book_catalog_entrie.update_attributes(params[:book_catalog_entrie])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book_catalog_entrie = BookCatalogEntrie.find(params[:id])
    @book_catalog_entrie.destroy

    respond_to do |format|
      format.html { redirect_to book_catalog_entries_url }
      format.json { head :no_content }
    end
  end
end
