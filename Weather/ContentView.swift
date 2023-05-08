import SwiftUI

struct ContentView: View {
    
   @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? Color.black : Color.blue,
                           bottomColor: isNight ? Color.gray : Color("lightBlue"))
            
            VStack {
                CityTextView(cityName: "Morogoro")
                
                WeatherStatusView(iconName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                  temperature: 26)
                    .padding(.bottom, 48)
                
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Tue", iconName: "cloud.sun.fill", temperature: 25)
                    
                    WeatherDayView(dayOfWeek: "Wed", iconName: "sunset.fill", temperature: 25)
                    
                    WeatherDayView(dayOfWeek: "Thu", iconName: "cloud.fill", temperature: 25)
                    
                    WeatherDayView(dayOfWeek: "Fri", iconName: "cloud.sun.fill", temperature: 27)
                    
                    WeatherDayView(dayOfWeek: "Sa", iconName: "cloud.sun.fill", temperature: 27)
                    
                    WeatherDayView(dayOfWeek: "Sun", iconName: "cloud.rain.fill", temperature: 23)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                }
                .frame(width: 280, height: 50)
                .background(Color.white)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
                
                Spacer()
            }
        }
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: iconName )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    
    var iconName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
