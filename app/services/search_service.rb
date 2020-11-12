class SearchService
  def call(params)
    %i[
      filter_by_text
      filter_by_advert_author
      filter_by_address
    ].inject(::Advert.includes(:user)) { |adverts, method| send method, adverts, params }
  end

  private

  def filter_by_text(adverts, params)
    return adverts if params[:text].blank?

    adverts.where('text like ?', "%#{params[:text]}%")
  end

  def filter_by_advert_author(adverts, params)
    return adverts if params[:advert_author].blank?

    adverts.joins(:user)
           .where('users.full_name like ?', "%#{params[:advert_author]}%")
  end

  def filter_by_address(adverts, params)
    return adverts if params[:address].blank?

    adverts.joins(:user)
           .where('users.zip LIKE :address
                  OR users.country LIKE :address
                  OR users.state LIKE :address
                  OR users.city LIKE :address
                  OR users.address LIKE :address',
                  address: "%#{params[:address]}%")
  end
end
