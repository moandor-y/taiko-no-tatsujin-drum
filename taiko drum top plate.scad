$fa = 1;
$fs = 0.5;

function polar(theta, r) = [ r * cos(theta), r *sin(theta) ];

mountingHoles = [
    polar(99, 193.5),
    polar(150, 193.5),
    polar(-150, 193.5),
    polar(-99, 193.5),
    polar(81, 193.5),
    polar(30, 193.5),
    polar(-30, 193.5),
    polar(-81, 193.5),
    polar(99, 140),
    polar(180, 140),
    polar(-99, 140),
    polar(81, 140),
    polar(0, 140),
    polar(-81, 140),
];

difference()
{
    union()
    {
        difference()
        {
            circle(213.5);
            circle(173.5);
            translate([ -5, -500, 0 ])
            {
                square(1000);
            }
        }

        difference()
        {
            circle(213.5);
            circle(173.5);
            translate([ -995, -500, 0 ])
            {
                square(1000);
            }
        }

        difference()
        {
            circle(163.5);
            translate([ -5, -500, 0 ])
            {
                square(1000);
            }
        }

        difference()
        {
            circle(163.5);
            translate([ -995, -500, 0 ])
            {
                square(1000);
            }
        }
    }

    for (i = [0:len(mountingHoles) - 1])
    {
        hole = mountingHoles[i];
        translate([ hole[0], hole[1], 0 ])
        {
            circle(8.5);
        }
    }
}

for (i = [0:len(mountingHoles) - 1])
{
    hole = mountingHoles[i];
    translate([ hole[0], hole[1], 0 ])
    {
        circle(3.175);
    }
}
