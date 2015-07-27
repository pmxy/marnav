#ifndef __NMEA__ROT__HPP__
#define __NMEA__ROT__HPP__

#include "sentence.hpp"
#include <marnav/utils/optional.hpp>

namespace marnav
{
namespace nmea
{

/// @brief ROT - Rate Of Turn
///
/// @code
///        1   2
///        |   |
/// $--ROT,x.x,A*hh<CR><LF>
/// @endcode
///
/// Field Number:
/// 1. Rate Of Turn, degrees per minute, "-" means bow turns to port
/// 2. Status
///    - A = data is valid
///    - V = invalid
///
class rot : public sentence
{
public:
	constexpr static const sentence_id ID = sentence_id::ROT;
	constexpr static const char * TAG = "ROT";

	rot();
	rot(const rot &) = default;
	rot & operator=(const rot &) = default;

	static std::unique_ptr<sentence> parse(const std::string & talker,
		const std::vector<std::string> & fields) throw(std::invalid_argument);

protected:
	virtual std::vector<std::string> get_data() const override;

private:
	utils::optional<double> deg_per_minute;
	utils::optional<status> data_valid;

public:
	NMEA_GETTER(deg_per_minute)
	NMEA_GETTER(data_valid)

	void set_deg_per_minute(double t) { deg_per_minute = t; }
	void set_data_valid(status t) { data_valid = t; }
};
}
}

#endif
