$fa = 1;
$fs = 0.5;

function polar(theta, r) = [ r * cos(theta), r *sin(theta) ];
function polar3(theta, r) = [ r * cos(theta), r *sin(theta), 0 ];

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

    [80, 87],
    [80, -87],
    [-80, 87],
    [-80, -87],
];

wireHoleInnerRadius = (193.5 + 140) / 2 - 5;
wireHoleOuterRadius = wireHoleInnerRadius + 10;
wireHoleCentralAngle = 30;
wireHoleAngleStart = 90 - wireHoleCentralAngle / 2;
wireHoleAngleEnd = 90 + wireHoleCentralAngle / 2;

difference()
{
    circle(213.5);

    for (i = [0:len(mountingHoles) - 1])
    {
        hole = mountingHoles[i];
        translate([ hole[0], hole[1], 0 ])
        {
            circle(3.175);
        }
    }

    for (i = [0 : 3]) {
        rotate(a = 90 * i, v = [0, 0, 1]) 
        translate(v = polar3(wireHoleAngleEnd, wireHoleInnerRadius))
        {
            minkowski()
            {
                translate(v = -polar3(wireHoleAngleEnd, wireHoleInnerRadius))
                {
                    difference()
                    {
                        circle(r = wireHoleOuterRadius);
                        circle(r = wireHoleInnerRadius);
                        polygon(points =
                                    [
                                        [ 0, 0 ],
                                        polar(wireHoleAngleEnd, 1000),
                                        [ -1000, 1000 ],
                                        [ -1000, -1000 ],
                                        [ 1000, -1000 ],
                                        [ 1000, 1000 ],
                                        polar(wireHoleAngleStart, 1000),
                                    ],
                                convexity = 10);
                    }
                }

                circle(r = 5);
            }
        }
    }
}