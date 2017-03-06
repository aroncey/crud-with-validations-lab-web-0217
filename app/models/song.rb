class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validate :release_year_method
  # validate :current_year

  def release_year_method
    if released
      if !(release_year != nil && release_year <= Time.current.year)
        errors.add(:release_year, "Error, released pior too this year!")
        return false
      end

    elsif release_year
      if !(release_year <= Time.current.year)
        errors.add(:release_year, "Error!")
        return false
      end
    end
  end

  # def is_released?
  # 		if released == true
  # 			return true
  # 		else
  # 			errors.add(:released, "Please mark the song as 'released'")
  # 			return false
  # 		end
  # 	end

# linked to the "validates :current_year"
  # def current_year
  #    if Song.all.any? {|song| song.artist_name == artist_name && song.title == title && song.release_year==release_year}
  #      errors.add(:title, "no bueno")
  #    end
  #  end


end
