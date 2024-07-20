#include <stdio.h>
#include <time.h>

int main() {
    printf("Size of time_t:     %zu bytes\n", sizeof(time_t));

    time_t current_time = time(NULL);
    printf("Current time:       %lld  %s", (long long) current_time, ctime(&current_time));

    const int SECONDS_IN_A_YEAR = 365 * 24 * 60 * 60;
    const int SECONDS_IN_20_YEARS = 20 * SECONDS_IN_A_YEAR + (5 * 24 * 60 * 60);

    time_t twenty_year_later_time = current_time + SECONDS_IN_20_YEARS;
    printf("Twenty years later: %lld  %s", (long long) twenty_year_later_time, ctime(&twenty_year_later_time));

    return 0;
}
