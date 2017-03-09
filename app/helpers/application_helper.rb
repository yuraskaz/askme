# (c) goodprogrammer.ru
#
# В этом файле мы можем писать вспомогательные методы (хелперы)
# для представлений (view) нашего приложения
module ApplicationHelper
  #метод возвращающий в правильном склонении слова(склонятор)
  def quantity_word(number,words)
    if number == nil
      number = 0
    end
    ostatok = number % 10
    if ostatok == 1
      return words[0]
    end

    if ostatok >= 2 && ostatok <= 4
      return words[1]
    end

    if (ostatok >= 5 && ostatok <= 9) || ostatok == 0
      return words[2]
    end

  end

  # Этот метод возвращает ссылку на автарку пользователя, если она у него есть
  # Или ссылку на дефолтную аватарку, которая лежит в app/assets/images
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end


  # Хелпер, рисующий span тэг с иконкой из font-awesome
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
