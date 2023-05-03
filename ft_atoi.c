/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_re.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dajeon <dajeon@student.42seoul.kr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/03 18:33:08 by dajeon            #+#    #+#             */
/*   Updated: 2023/05/03 20:23:59 by dajeon           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

static long	ft_strtol(const char *nptr);
static int	ft_ctoi(int c, int sign);
static long	ft_check(long nbr, int new);
static int	ft_isspace(int c);
static int	ft_isdigit(int c);

int	ft_atoi(const char *nptr)
{
	return (ft_strtol(nptr));
}

static long	ft_strtol(const char *nptr)
{
	int		sign;
	long	nbr;

	while (ft_isspace(*nptr))
		nptr++;
	sign = 1;
	if (*nptr == '-' || *nptr == '+')
	{
		if (*(nptr++) == '-')
			sign = -1;
	}
	while (ft_isdigit(*nptr) == 0)
		nbr = ft_check(nbr, ft_ctoi(*(nptr++), sign));
	return (nbr);
}

static int	ft_isspace(int c)
{
	if (c == 32 || (9 <= c && c <= 13))
		return (1);
	else
		return (0);
}

static int	ft_ctoi(int c, int sign)
{
	return (c - '0');
}

static int	ft_isdigit(int c)
{
	return ('0' <= c && c <= '9');
}

static long	ft_check(long nbr, int new)
{
	if (nbr * 10 > LONG_MAX + new)
		return (-1);
	else if (nbr * 10 < LONG_MIN + new)
		return (0);
	else 
		return (nbr * 10 + new);
}
