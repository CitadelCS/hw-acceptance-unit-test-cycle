require 'rails_helper'

describe Movie do
    it '.find_movies_with_same_director' do
        expect(Movie).to respond_to(:find_movies_with_same_director).with(1)
    end
    
    it 'should find movies with the same director' do
        m1 = Movie.create! :director => "yo mamma"
        m2 = Movie.create! :director => "yo mamma"
        expect(Movie.find_movies_with_same_director(m1.id)).to include(m2)
        expect(Movie.find_movies_with_same_director(m2.id)).to include(m1)
    end
    
    it 'should not find movies with the same director' do
        m1 = Movie.create! :director => "yo mamma"
        m2 = Movie.create! :director => "yo daddy"
        expect(Movie.find_movies_with_same_director(m1.id)).not_to include(m2)
        expect(Movie.find_movies_with_same_director(m2.id)).not_to include(m1)
    end
    
end