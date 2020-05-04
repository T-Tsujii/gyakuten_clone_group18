require "import.rb"

namespace :import_csv do
  desc "CSVデータをaws_textsテーブルへインポートするタスク"
  task aws_texts: :environment do
    list = Import.csv_data(path: "db/csv_data/aws_text_data.csv")
    puts "インポート処理を開始"
    begin
      AwsText.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗:UnknownAttributeError"
    end
  end

  desc "moviesテーブルへCSVデータをインポートするタスク"
  task movies: :environment do
    list = Import.csv_data(path: "db/csv_data/movie_data.csv")
    puts "インポート処理を開始"
    begin
      Movie.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end

  desc "questionsテーブルへCSVデータをインポートするタスク"
  task questions: :environment do
    list = Import.csv_data(path: "db/csv_data/question_data.csv")
    puts "インポート処理を開始"
    begin
      Question.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end
end
