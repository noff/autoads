class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.all
  end

  # POST
  def generate
    titles = Title.all
    sentences = Sentence.all
    sentences2 = Sentence.all
    titles.each do |title|
      sentences.each do |s|
        sentences2.each do |s2|
          if s.id != s2.id
            ad = Ad.new
            ad.title_id = title.id
            ad.sentence1_id = s.id
            ad.sentence2_id = s2.id
            ad.save
          end
        end
      end
    end
    redirect_to ads_path, notice: 'Ads generated'
  end

  def download_csv
    text = ""
    Ad.all.each do |ad|
      text += "Add	enabled	\"#{ad.title.value}\"	\"#{ad.sentence1.value}\"	\"#{ad.sentence2.value}\"	yellowbricks.ru	#{ad.generate_url}	Search Network with Display Select	Standard	 --	eligible	0	0	0.00%	0.00	0.00	0.0		Электронные еноты	Сгенерированные объявления	9783304266	Text ad\n"
    end
    render text: text
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
  end

  # GET /ads/new
  def new
    @ad = Ad.new
  end

  # GET /ads/1/edit
  def edit
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ad }
      else
        format.html { render action: 'new' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params[:ad]
    end
end
