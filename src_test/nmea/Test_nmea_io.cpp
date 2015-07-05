#include <gtest/gtest.h>
#include <marnav/nmea/io.hpp>

namespace
{

using namespace marnav;

class Test_nmea_io : public ::testing::Test
{
};

TEST_F(Test_nmea_io, read_empty_latitude_string)
{
	geo::latitude lat{12.3};
	nmea::read("", lat);

	EXPECT_EQ(geo::latitude{}, lat);
}

TEST_F(Test_nmea_io, read_empty_longitude_string)
{
	geo::longitude lon{123.4};
	nmea::read("", lon);

	EXPECT_EQ(geo::longitude{}, lon);
}

TEST_F(Test_nmea_io, format_int32_hex)
{
	const int32_t val = 0xabcd;
	auto s = nmea::format(val, 1, nmea::data_format::hex);

	EXPECT_STREQ("abcd", s.c_str());
}

}