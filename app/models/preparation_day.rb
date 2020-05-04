class Preparation_day < ActiveHash::Base
  self.data = [
      {id:0, name:'選択してください。'},{id: 1, name: '1~2日で発送'}, {id: 2, name: '着払い（購入者負担）'}, {id: 3, name: '4~7日で発送'},
  ]
end
