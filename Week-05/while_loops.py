# working with while loops
# keyboard shortcut to interrupt script is ctrl+c

today_weather = input("What is today's weather? ")

weather_report = []

# while today_weather != "exit":
#     weather_report.append(today_weather)
#     print("Interesting, what is the next day's weather?")
#     today_weather = input("Next day weather (type 'exit' to exit): ")

# print(f'Weather report: {weather_report}')

counter = 0

while counter < 10:
    weather_report.append(today_weather)
    counter += 1
    print("Interesting, what is the next day's weather?")
    today_weather = input("Next day weather: ")