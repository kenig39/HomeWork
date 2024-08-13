import Darwin

class Animal{
    var energi:Int
    var weght:Int
    var periodOld: Int
    var maxOld:Int
    var name:String
    
    
    static let nameAnimal = ["cow","horse"]
    
   required init(energi:Int, weght:Int, maxOld:Int, name: String){
        (self.energi, self.weght, self.maxOld, self.name) = (energi, weght,maxOld,name)
        periodOld = 4
    }
    
    
    var IsTooOld: Bool{
        get {
            return periodOld <= maxOld
        }
    }
    
    func slip(){
        energi += 5
        periodOld += 1
        print("\(name) спит")
    }
    func eat(){
        energi += 3
        weght += 1
        periodOld += 1
        print("\(name) ест")
    }
    func move (){
        energi -= 5
        weght -= 1
        periodOld += 1
    }
    
    func tryIncrementAge (){
        if (Bool.random()){
            periodOld <= maxOld && energi <= maxOld && weght <= maxOld
        } else {
            periodOld += 1
        }
    }
    
    func wasBorn()-> Self{
        weght = Int.random(in: 1...5)
        energi = Int.random(in: 1...10)
       let child = Self(energi: energi, weght: weght,maxOld: 15, name: self.name)
        print("Родился \(self.name), энергией \(energi), весом \(weght), максимальным возрастом \(maxOld) ")
        return child
    }
    
}

class Fish:Animal{
    
    override func move() {
        super.move()
        print("\(name) Плывет")
    }
   
    static let nameFish = ["shark","dolfin","cowFish"]
}


class Bird:Animal{
    override func move(){
        super.move()
        print("\(name) Летит")
    }

    static let namesBird = ["sworrow","duck","eagle","hawk","heron"]
}
class Dog:Animal{
    override func move() {
        super.move()
        print("\(name) Бежит")
  }

    
    static let namesDog = ["colli","shipherd"]
}


class NatureReserve {
    
    var arrayNature:[Animal] = []
    
    init() {
        for _ in 0..<2 {
            arrayNature.append(Dog(energi: Int.random(in: 1...30), weght: Int.random(in: 1...40), maxOld: Int.random(in: 1...20), name: Dog.namesDog.randomElement()!))
        }
        for _ in 0..<3 {
            arrayNature.append(Fish(energi: Int.random(in: 1...30), weght: Int.random(in: 1...50), maxOld: Int.random(in: 1...20), name: Fish.nameFish.randomElement()!))
        }
        for _ in 0..<5 {
            arrayNature.append(Bird(energi: Int.random(in: 1...30), weght: Int.random(in: 1...13), maxOld: Int.random(in: 1...20), name: Bird.namesBird.randomElement()!))
        }
            for _ in 0..<2 {
                arrayNature.append(Animal(energi: Int.random(in: 1...30), weght: Int.random(in: 1...80), maxOld: Int.random(in: 1...20), name: Animal.nameAnimal.randomElement()!))
            }
        
        }

    func lifeCycle(){
        
        for i in arrayNature{
            switch Int.random(in: 0...3){
            case 0: i.move()
            case 1: i.eat()
            case 2: i.slip()
            case 3: arrayNature.append(i.wasBorn())
            default:
                break
            }
        }
       
      arrayNature.removeAll(where: {$0.IsTooOld})
       print("Животных в заповеднике \(arrayNature.count)")

        }
}
let natural = NatureReserve()
natural.lifeCycle()

      
