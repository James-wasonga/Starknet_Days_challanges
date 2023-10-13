// As part of a weather application, design a struct called "WeatherData" to store weather information, including "temperature" (uint32), "humidity" (uint32), "windSpeed" (uint32), and "description" (string). Implement a method named "isCold" that returns true if the temperature is below a certain threshold (e.g., 10 degrees Celsius) and false otherwise.

use debug::PrintTrait;

#[derive(Drop, Copy)]
struct WeatherData {
    temperature: u32,
    humidity: u32,
    wind_speed: u32,
    description: felt252
}

trait WeatherDataTrait {
    fn is_cold(self: @WeatherData) -> bool;
}

impl WeatherDataImpl of WeatherDataTrait {
    fn is_cold(self: @WeatherData) -> bool {
         if *(self.temperature) < 10 {
            true
        }else{
            false
        }
    }
}

fn main() {
    let my_weather_data = WeatherData {temperature: 34, humidity: 12, wind_speed: 21, description: 'the weather is cold'};
    my_weather_data.is_cold().print();
}

